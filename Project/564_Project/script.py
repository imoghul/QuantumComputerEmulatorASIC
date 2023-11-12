import git

def get_commits_for_file(repo_path, file_path):
    repo = git.Repo(repo_path)
    file_commits = []

    for commit in repo.iter_commits(paths=file_path):
        file_commits.append(commit)

    return file_commits

def main():
    repo_path = '.'
    file_path = 'synthesis/reports/cell_report_final.rpt'

    commits = get_commits_for_file(repo_path, file_path)

    for commit in commits:
        print(f"Commit: {commit.hexsha}")
        print(f"Author: {commit.author.name} <{commit.author.email}>")
        print(f"Date: {commit.authored_datetime}")
        print(f"Message: {commit.message}")
        print("\n")

if __name__ == "__main__":
    main()