FROM wordpress:5.2.1-php7.1-apache

# Pull LinkLives theme from Github
#RUN curl -o /wordpress/link-lives-cms.zip -L https://github.com/copenhagencityarchives/link-lives-cms

# Extract theme into themes folder and remove unused files
#RUN cd /wordpress && unzip link-lives-cms.zip && mv link-lives-cms/wordpress/wp-content/themes/linklives/* ./wp-contents/themes/linklives && rm -rf link-lives-cms link-lives-cms.zip