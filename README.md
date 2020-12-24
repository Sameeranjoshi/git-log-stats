# git-log-stats
Find contributions made by user in a particular project's `git log` and generates excel using single command.

# RUN
- Fill values in config.txt

`bash genCommitsTextFileSummary.sh`
- To generate the commit's by user.

`bash genReviewTextFileSummary.sh`
- To generate the code reviewed by user, currently very specific keyword are used based on LLVM-PROJECT.
  If needed please modify `trailers.awk` for your project.
 
