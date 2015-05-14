require "comic"

describe Comic do
  let(:comic) { Comic.new({"id" => 1, "title" => "Ant-Man"}) }

  it 'has an id' do
    expect(comic.id).to eq 1
  end

  it 'has a title' do
    expect(comic.title).to eq "Ant-Man"
  end

end
