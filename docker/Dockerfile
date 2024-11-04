# Use the latest R image as the base
FROM rocker/r-ver:latest

# Set the working directory in the container
WORKDIR /app

# Install any necessary R packages (optional, specify packages if needed)
# RUN R -e "install.packages(c('dplyr', 'ggplot2'))"

# Copy your R script files into the container
COPY . .

# Set up default command to start an interactive R session
CMD ["R"]