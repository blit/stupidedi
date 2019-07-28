# frozen_string_literal: true
module Stupidedi
  module Contrib
    module SeventyTen
      module TransactionSetDefs

        SegmentReqs = Versions::FunctionalGroups::FortyTen::SegmentReqs
        SegmentDefs = Versions::FunctionalGroups::FortyTen::SegmentDefs

        autoload :QM214,
          "stupidedi/contrib/007010/transaction_set_defs/QM214"

      end
    end
  end
end
