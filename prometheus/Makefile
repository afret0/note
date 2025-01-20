VERSION = 241230-02
prod:

	docker build -t registry.cn-hangzhou.aliyuncs.com/kiwi0325/prometheus:$(VERSION) .
	docker buildx build --platform linux/amd64,linux/arm64 -t registry.cn-hangzhou.aliyuncs.com/kiwi0325/prometheus:$(VERSION) --push .


.PHONY: prod