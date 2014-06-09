require 'spec_helper'

describe RSpecLets::Helper do
  context 'simple lazy lets' do
    lets(foo: -> { 'bar' },
         hello: -> { 'world'})

    it 'works as expected' do
      expect(foo).to eq('bar')
      expect(hello).to eq('world')
    end

    context 'forced initialization with lets!' do
      lets!(foo: -> { $foo_was_initialized = true },
            bar: -> { $bar_was_initialized = true})

      it 'works as expected' do
        expect($foo_was_initialized).to be_true
        expect($bar_was_initialized).to be_true
      end
    end

    context 'array keys' do
      lets([:a, :b, :c] => -> { 'hello world' })
      lets([:d, :e, :f] => ->(index, key) { [index, key] })

      it 'initializes each of the keys in the array' do
        expect(a).to eq('hello world')
        expect(b).to eq('hello world')
        expect(c).to eq('hello world')
      end

      it 'can accept key and index' do
        expect(d).to eq([0, :d])
        expect(e).to eq([1, :e])
        expect(f).to eq([2, :f])
      end
    end

    context 'help defines helper methods' do
      help(foo: ->(val) { val * 2 })

      it 'defines a function' do
        expect(foo(2)).to eq(4)
      end
    end
  end
end
