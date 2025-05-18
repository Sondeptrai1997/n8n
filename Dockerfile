FROM node:18

# Cài đặt các phụ thuộc hệ thống cho Chrome
RUN apt-get update && apt-get install -y \
  wget \
  gnupg \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxi6 \
  libxtst6 \
  libnss3 \
  libxrandr2 \
  libasound2 \
  libpangocairo-1.0-0 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libgtk-3-0

# Tải và cài đặt Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update \
  && apt-get install -y google-chrome-stable

# Cài n8n (hoặc ứng dụng của bạn)
RUN npm install -g n8n

CMD ["n8n", "start"]
