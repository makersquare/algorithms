require 'spec_helper'

describe Traverse do

  let(:sample_tree) do
    Node.new('F',
      Node.new('B',
        Node.new('A', nil, nil),
        Node.new('D',
          Node.new('C', nil, nil),
          Node.new('E', nil, nil)
        )
      ),
      Node.new('G',
        nil,
        Node.new('I',
          Node.new('H', nil, nil),
          nil
        )
      )
    )
  end

  it "visits the root node" do
    root_data = nil
    Traverse.root_only(sample_tree) do |data|
      root_data = data
    end
    expect(root_data).to eq 'F'
  end

  it "traverses with pre-order" do
    visits = []
    Traverse.with_preorder(sample_tree) do |data|
      visits << data
    end

    expect(visits.count).to eq 9
    expect(visits).to eq %w{F B A D C E G I H}
  end

  it "traverses with in-order" do
    visits = []
    Traverse.with_inorder(sample_tree) do |data|
      visits << data
    end

    expect(visits.count).to eq 9
    expect(visits).to eq %w{A B C D E F G H I}
  end

  it "traverses with post-order" do
    visits = []
    Traverse.with_postorder(sample_tree) do |data|
      visits << data
    end

    expect(visits.count).to eq 9
    expect(visits).to eq %w{A C E D B H I G F}
  end

  it "traverses with level-order", :pending => "Extension!" do
    visits = []
    Traverse.with_levelorder(sample_tree) do |data|
      visits << data
    end

    expect(visits.count).to eq 9
    expect(visits).to eq %w{F B G A D I C E H}
  end
end
