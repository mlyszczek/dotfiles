#!/bin/bash

exceptions=".
"

ret=0
for d in $(find . -type d); do
	if [[ "${d}" =~ ./.vim/(bundle|plugged)/YouCompleteMe/* ]]; then
		# false positives
		continue
	fi

	except=0
	for e in ${exceptions}; do
		if [ "${e}" = "${d}" ]; then
			# ignore false positives
			except=1
			break
		fi
	done

	if [ ${except} -eq 1 ]; then
		continue
	fi

	base=$(basename $d)

	if [ -d "${d}/${base}" ]; then
		ret=1
		echo "${d}"
	fi
done

exit ${ret}
