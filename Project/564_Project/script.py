import git
import atexit

def get_commits_for_file(repo_path, file_path):
    repo = git.Repo(repo_path)
    file_commits = []

    for commit in repo.iter_commits():
        file_commits.append(commit)

    return file_commits

def read_file_at_commit(repo, commit, file_path):
    # Checkout the specific commit
    repo.git.checkout(commit.hexsha, force=True)

    # Read the content of the file
    with open(file_path, 'r') as file:
        content = file.read()

    return content

def return_to_latest_commit(repo):
    # Return to the latest commit
    repo.git.checkout('main', force=True)  # Replace 'master' with your branch name if it's different


def main():
    repo_path = '../..'
    file_path = 'Project/564_Project/synthesis/reports/cell_report_final.rpt'

    repo = git.Repo(repo_path)
    atexit.register(lambda : return_to_latest_commit(repo))
    commits = get_commits_for_file(repo_path, file_path)

    minArea = 100000
    minPer = 100000
    minCommit = 0
    minAreaPer = minArea*minPer


    for commit in commits:
        if str(commit.hexsha) == "26aa97b7d2db2955aab5d58292ab5850a760b465" : break;
        # Read the file content at the specific commit
        try:

            area = float((read_file_at_commit(repo, commit, 'synthesis/reports/cell_report_final.rpt').split('\n')[-3]).split(' ')[-1])

            timing_max_slow = read_file_at_commit(repo, commit, 'synthesis/reports/timing_max_slow.rpt')
            assert("MyDesign" in timing_max_slow)
            assert("(VIOLATED)" not in timing_max_slow)
            timing_max_slow = float(timing_max_slow.split('\n')[-15].split(' ')[-1])

            timing_max_slow_fixed = read_file_at_commit(repo, commit, 'synthesis/reports/timing_max_slow_holdfixed_tut1.rpt')
            assert("MyDesign" in timing_max_slow_fixed)
            assert("(VIOLATED)" not in timing_max_slow_fixed)
            timing_max_slow_fixed = float(timing_max_slow_fixed.split('\n')[-15].split(' ')[-1])

            timing_min = read_file_at_commit(repo, commit, 'synthesis/reports/timing_min_fast_holdcheck_tut1.rpt')
            assert("MyDesign" in timing_min)
            assert("(VIOLATED)" not in timing_min)
            
            assert(timing_max_slow == timing_max_slow_fixed)

            CLOCK_PER = timing_max_slow

            areaPer = CLOCK_PER*area
            if(areaPer<minAreaPer):
                minAreaPer = areaPer
                minArea = area
                minPer = CLOCK_PER
                minCommit = commit.hexsha

            print(area, CLOCK_PER, areaPer, commit.message)
            # print("\n\n")
            # print(f"Commit: {commit.hexsha}")
            # print(f"Author: {commit.author.name} <{commit.author.email}>")
            # print(f"Date: {commit.authored_datetime}")
            # print(f"Message: {commit.message}")
            # print(f"Area:{area}")
            # print(f"CLOCK_PER:{CLOCK_PER}")
        
        except Exception as e: print(str(e))

    print(minArea, minPer, minAreaPer, minCommit)
    return_to_latest_commit(repo)

if __name__ == "__main__":
    main()