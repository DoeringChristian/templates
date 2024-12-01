DOCKERIMG=texlive/texlive:latest
DOCKERCMD=podman
DOCKEREXEC=$(DOCKERCMD) exec $(CONTAINER) sh -c

PWD_HASH := $(shell PWD | md5sum | awk '{print $$1}')
CONTAINER := latex_$(PWD_HASH)

image:
	$(DOCKERCMD) build -t $(DOCKERIMG) .

container:
	$(DOCKERCMD) create --privileged -v $(PWD):$(PWD) -w $(PWD) -it --name $(CONTAINER) --replace $(DOCKERIMG)
	$(DOCKERCMD) start $(CONTAINER)

pdf:
	$(DOCKEREXEC) "latexmk --pdf" || { echo "Creating Container"; make container; $(DOCKEREXEC) "latexmk --pdf"; }
