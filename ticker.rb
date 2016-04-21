class Ticker
  require 'json'
  require 'net/http'
  require 'csv'
  Pairs = [
    "BTC_XMR",
    "BTC_MAID",
    "BTC_ETH",
    "BTC_BTCD",
    "BTC_BTS",
    "BTC_DGB",
    "BTC_DOGE",
    "BTC_NMC",
    "BTC_PPC",
    "BTC_QORA",
    "BTC_SILK",
    "BTC_SYS",
    "BTC_XRP",
    "USDT_BTC",
    ]
  def parser
    tocall = "https://poloniex.com/public?command=returnTicker"
    uri = URI.parse(tocall.to_s)
    response = Net::HTTP.get_response(uri)
    obj = JSON.parse(response.body)
    Pairs.each do |pair|
      p obj[pair]["last"]
      all = [ obj[pair]["last"], obj[pair]["percentChange"] ]
      all = all.to_json
      filename = "public/" + pair + ".json"
      file = open(filename, 'w+')
      file.write(all)
      file.close
    end
  end

end
