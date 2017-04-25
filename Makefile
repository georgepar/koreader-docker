KOREADER_TAG=v2017.03.08-nightly
DEVICE=kobo

DEPS_IMG=koreader:dependencies
IMG=koreader

all: dependencies deps_img_exists koreader

dependencies:
        docker build -t $(DEPS_IMG) --build-arg KOREADER_TAG=$(KOREADER_TAG) deps

deps_img_exists:
        docker inspect --type=image $(DEPS_IMG) && echo "OK" || \
            (echo "Docker image $(DEPS_IMG) does not exist. Run \`make deps\` first"; exit 1)

koreader: deps_img_exists
        docker build -t $(IMG) --build-arg DEVICE=$(DEVICE) .


clean:
        docker rmi $(DEPS_IMG)
        docker rmi $(IMG)
