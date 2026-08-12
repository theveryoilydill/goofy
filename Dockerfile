FROM kasmweb/chrome:1.18.0

# KasmVNC listens on 6901 by default; Render will route to whatever
# port you declare in the dashboard. No EXPOSE strictly needed but
# it documents intent.
EXPOSE 6901

# Password for the browser session (change me)
ENV VNC_PW=1234
ENV VNC_RESOLUTION=1600x1000
