root=$(pwd)
d=$1
echo "traversing ${d}";
# if [ -f "${d}/${report_file}" ]; then
#     echo "${d}/${report_file} exists, skipping analysis";
# else
cd $d
echo "running snyk analysis on ${d}"
snyk test --json --json-file-output=$root/snyk-report.json;
snyk code test --org=34123eaa-ca83-40dc-a879-93aa551e30d7
# rm -rf ../scans
cd $root