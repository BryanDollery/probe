default:
	@echo "Make the probe docker image"

hello:
	@echo "Probe: Build and relese version $(VERSION)"

all: hello build release

build:
	@docker build -t "bryandollery/probe:$(VERSION)" .
	@docker tag "bryandollery/probe:$(VERSION)" bryandollery/probe:latest
	@rm -f version &> /dev/null
	@echo $(VERSION) > version

release:
	@echo "Releasing version $(VERSION)"
	@docker push "bryandollery/probe:$(VERSION)"

test:
	@docker run -it --rm  bryandollery/probe

save:
	@exec ./commit.sh
