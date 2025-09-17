test:
# 	docker stop caddy || true
# 	docker rm caddy || true

	docker build -f ./Dockerfile  -t registry.cn-hangzhou.aliyuncs.com/kiwi0325/caddy:test .
	docker push registry.cn-hangzhou.aliyuncs.com/kiwi0325/caddy:test
	docker rmi registry.cn-hangzhou.aliyuncs.com/kiwi0325/caddy:test

	curl https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjMWJkOTMwOTkxZWU2NDQwNDk4MmJjNTRhN2ViMjFhMjEiLCJpZCI6Ijk2MTY1NzM0OTI4ODc1NjcwIn0.l4v-MlcsSF0NFgu7sKE6rF-3yNJwGx2uUP38t0a09pLrQ9M6mct-z5GXi3mqADJ5HY4dw-lhlAzrGqdf3JrHag5KTGXduLPbQEbIzwpMDhWkq-MkA4b95dLG07RvztsUEqu8GkMA-vBjJce7CBf-hpY6NDmXIj8aJUAR1jf1oIk

# 	docker stop caddy || true
# 	docker rm caddy || true
# # 	docker run  -d --network host --name caddy registry.cn-hangzhou.aliyuncs.com/kiwi0325/caddy:test
# 	docker run  -d -p 10136:10136 --name caddy registry.cn-hangzhou.aliyuncs.com/kiwi0325/caddy:test


.PHONY: test
