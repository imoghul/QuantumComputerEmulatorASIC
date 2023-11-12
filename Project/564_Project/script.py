import git
import atexit

def get_commits_for_file(repo_path, file_path):
    repo = git.Repo(repo_path)
    file_commits = []

    for commit in repo.iter_commits(paths=file_path):
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

    for commit in commits:
        print(f"Commit: {commit.hexsha}")
        print(f"Author: {commit.author.name} <{commit.author.email}>")
        print(f"Date: {commit.authored_datetime}")
        print(f"Message: {commit.message}")

        # Read the file content at the specific commit
        try:
            cell_report_final_contents = read_file_at_commit(repo, commit, 'synthesis/reports/cell_report_final.rpt').split(' ')[-2]
            print(f"File Content:\n{cell_report_final_contents}\n")
        except Exception as e: print(str(e))

    return_to_latest_commit(repo)

if __name__ == "__main__":
    main()