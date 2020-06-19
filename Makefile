.PHONY: coverletter.pdf resume.pdf

CC = xelatex
OUTPUT_DIR = out
RESUME_DIR = resume
COVERLETTER_DIR = coverletter
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
COVERLETTER_SRCS = $(shell find $(COVERLETTER_DIR) -name '*.tex')

# Make the output directout
DIRS= $(OUTPUT_DIR)

$(shell mkdir -p $(DIRS))

resume.pdf: resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

coverletter.pdf: coverletter.tex $(COVERLETTER_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)
