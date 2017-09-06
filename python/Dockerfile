FROM continuumio/miniconda3

# Set up code directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY environment.yml .

# Install dependencies
RUN conda env create -f environment.yml

# Make sure that the environment updates appropriately (sometimes needed, doesn't hurt)
RUN conda env update -n codefordc -f environment.yml

# Activate environment
RUN echo "export PATH=/opt/conda/envs/housing-insights/bin:$PATH" >> /root/.bashrc

EXPOSE 5000