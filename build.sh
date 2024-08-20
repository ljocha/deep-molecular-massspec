#!/bin/bash

image=ljocha/neims

case $(basename $0) in
	build.sh)
		docker build -t $image .
		docker push $image
		;;
	run.sh)
		docker run --rm -ti --gpus all --ulimit memlock=-1 --ulimit stack=67108864 \
			-v $PWD:/work -w /work $image python3 /opt/neims/make_spectra_prediction.py "$@"
		;;
	*) echo "$0: WTF?" >&2 ; exit 1 ;;
esac
