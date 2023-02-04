# 自分の過去のトゥートを全て削除するスクリプト
#
# 使用してるAPIは下記。
# https://docs.joinmastodon.org/methods/accounts/#statuses
# https://docs.joinmastodon.org/methods/statuses/#delete
#
# トゥート削除APIのRateLimitが1req/minと厳しいので全て削除するには結構時間がかかる
# https://docs.joinmastodon.org/api/rate-limits/

require "mastodon"
require "dotenv"
require "pry"

Dotenv.load

client = Mastodon::REST::Client.new(base_url: ENV["MASTODON_BASE_URL"], bearer_token: ENV["MASTODON_BEARER_TOKEN"])

i = 0
total = ENV["TOTAL_STATUS_COUNT"].to_i / 40
while i < total
  statuses = client.get_account_statuses(ENV["MASTODON_MY_ID"], {limit: 40})
  statuses.each do |status|
    begin
      id = status.attributes["id"]
      created_at = status.attributes["created_at"]
      puts("Deleting status #{id} created at #{created_at}.")
      client.destroy_status(id)
      sleep(61)
    rescue => e
      puts(e)
    end
  end

  if statuses.size == 0
    break
  end

  i += 1
end
