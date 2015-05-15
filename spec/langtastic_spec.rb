require 'spec_helper'
require 'langtastic'

describe Langtastic do
  it 'has a version number' do
    expect(Langtastic::VERSION).not_to be nil
  end

  describe '.subtags' do
    context 'parsing a language' do
      before do
        allow(Net::HTTP).to receive(:get).and_return(<<data)
Type: language
Subtag: aa
Description: Afar
Added: 2005-10-16
data
      end

      it 'parses the language' do
        expect(Langtastic.subtags).to eq([{
                                           'Type' => 'language',
                                           'Subtag' => 'aa',
                                           'Description' => 'Afar',
                                           'Added' => '2005-10-16',
                                         }])
      end
    end

    context 'duplicate feilds' do
      before do
        allow(Net::HTTP).to receive(:get).and_return(<<data)
Type: language
Subtag: ie
Description: Interlingue
Description: Occidental
Added: 2005-10-16
data
      end

      it 'parses the language' do
        expect(Langtastic.subtags).to eq([{
                                           'Type' => 'language',
                                           'Subtag' => 'ie',
                                           'Description' => 'Interlingue, Occidental',
                                           'Added' => '2005-10-16',
                                         }])
      end
    end

    context 'a multiline field' do
      before do
        allow(Net::HTTP).to receive(:get).and_return(<<data)
Type: language
Subtag: ia
Description: Interlingua (International Auxiliary Language
  Association)
Added: 2005-10-16
data
      end

      it 'parses the language' do
        expect(Langtastic.subtags).to eq(
          [{
            'Type' => 'language',
            'Subtag' => 'ia',
            'Description' => 'Interlingua (International Auxiliary Language  Association)',
            'Added' => '2005-10-16',
          }],
        )
      end

    end

    context 'multiple subtags' do
      before do
        allow(Net::HTTP).to receive(:get).and_return(<<data)
File-Date: 2015-05-12
%%
Type: language
Subtag: aa
Description: Afar
Added: 2005-10-16
%%
Type: language
Subtag: ab
Description: Abkhazian
Added: 2005-10-16
Suppress-Script: Cyrl
%%
Type: language
Subtag: ae
Description: Avestan
Added: 2005-10-16
data
      end

      it 'parses the languages' do
        expect(Langtastic.subtags).to eq([
          {
            'File-Date' => '2015-05-12',
          },
          {
            'Type' => 'language',
            'Subtag' => 'aa',
            'Description' => 'Afar',
            'Added' => '2005-10-16',
          },
          {
            'Type' => 'language',
            'Subtag' => 'ab',
            'Description' => 'Abkhazian',
            'Added' => '2005-10-16',
            'Suppress-Script' => 'Cyrl',
          },
          {
            'Type' => 'language',
            'Subtag' => 'ae',
            'Description' => 'Avestan',
            'Added' => '2005-10-16',
          },
        ])
      end
    end
  end
end
