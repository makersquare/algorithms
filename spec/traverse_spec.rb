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

  let(:captured_results) { [] }

  before do
    expect(Traverse).to receive(:capture).at_least(:once) {|data| captured_results.push(data) }
  end

  it "visits the root node" do
    Traverse.root_only(sample_tree)
    expect(captured_results).to eq ['F']
  end

  it "traverses with pre-order" do
    Traverse.with_preorder(sample_tree)
    expect(captured_results).to eq %w{F B A D C E G I H}
  end

  it "traverses with in-order" do
    Traverse.with_inorder(sample_tree)
    expect(captured_results).to eq %w{A B C D E F G H I}
  end

  it "traverses with post-order" do
    Traverse.with_postorder(sample_tree)
    expect(captured_results).to eq %w{A C E D B H I G F}
  end

  it "traverses with level-order", :pending => "Extension!" do
    Traverse.with_levelorder(sample_tree)
    expect(captured_results).to eq %w{F B G A D I C E H}
  end
end
