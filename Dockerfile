FROM kubeless/unzip AS unzip
WORKDIR /release
ADD https://github.com/jlfwong/speedscope/releases/download/v1.15.0/speedscope-1.15.0.zip speedscope.zip
RUN unzip -q speedscope.zip
RUN rm -f speedscope.zip

FROM nginx
COPY --from=unzip /release/* /usr/share/nginx/html
