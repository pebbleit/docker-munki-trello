FROM debian:wheezy
MAINTAINER Graham Gilbert <graham@pebbleit.com>
ENV TO_DEV_LIST="To Development" \
    DEV_LIST="Development" \
    TO_TEST_LIST="To Testing" \
    TEST_LIST="Testing" \
    TO_PROD_LIST="To Production" \
    MUNKI_PATH="/munki_repo" \
    SUFFIX="Production"
RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y python-pip && \ 
    pip install trello && \
    git clone https://github.com/pebbleit/munki-trello.git /munki-trello && \
    git clone https://github.com/munki/munki.git /munki-tools
CMD python /munki-trello/munki-trello.py --key $KEY --token $TOKEN --boardid $BOARDID --to-dev-list $TO_DEV_LIST --dev-list $DEV_LIST --to-test-list $TO_TEST_LIST --test-list $TEST_LIST --to-prod-list $TO_PROD_LIST --repo-path $MUNKI_PATH --suffix $SUFFIX --makecatalogs /munki-tools/code/client/makecatalogs