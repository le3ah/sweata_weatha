describe GifService do
  it "exists", :vcr do
    gif_service = GifService.new
    expect(gif_service).to be_a(GifService)
  end

  it "returns the image url based on a keyword", :vcr do
    keyword = "sunny"
    gif_service = GifService.new.find_gifs(keyword)

    expect(gif_service)
  end
end
