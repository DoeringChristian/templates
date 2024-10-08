DOCKERIMG=texlive/texlive:latest
DOCKERCMD=podman
CONTAINER=texlive
DOCKEREXEC=$(DOCKERCMD) exec $(CONTAINER) sh -c

image:
	$(DOCKERCMD) build -t $(DOCKERIMG) .

container:
	$(DOCKERCMD) create --privileged -v $(PWD):$(PWD) -w $(PWD) -it --name $(CONTAINER) --replace $(DOCKERIMG)
	$(DOCKERCMD) start $(CONTAINER)

pdf:
	$(DOCKEREXEC) "latexmk --pdf" || { echo "Creating Container"; make container; $(DOCKEREXEC) "latexmk --pdf"; }
