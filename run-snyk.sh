root=$(pwd)
d=$1
echo "traversing ${d}";
# if [ -f "${d}/${report_file}" ]; then
#     echo "${d}/${report_file} exists, skipping analysis";
# else
cd $d
echo "running snyk analysis on ${d}"
snyk code test --json --json-file-output=$root/snyk-report.json;
# rm -rf ../scans
cd $root