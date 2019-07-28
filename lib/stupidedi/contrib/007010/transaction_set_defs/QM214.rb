# frozen_string_literal: true
module Stupidedi
  module Contrib
    module SeventyTen
      module TransactionSetDefs
        d = Schema
        r = SegmentReqs
        s = SegmentDefs

        QM214 = d::TransactionSetDef.build("QM", "214",
          "Transportation Carrier Shipment Status Message",

          d::TableDef.header("Heading",
            s:: ST.use( 100, r::Mandatory, d::RepeatCount.bounded(1)),
            s::B10.use( 200, r::Mandatory, d::RepeatCount.bounded(1)),

            d::LoopDef.build("1000", d::RepeatCount.bounded(999999),
              s:: LX.use(100, r::Mandatory, d::RepeatCount.bounded(1)),
              s::L11.use(200, r::Optional , d::RepeatCount.bounded(999)),
              s:: K1.use(500, r::Optional , d::RepeatCount.bounded(10)),
              s::AT8.use(700, r::Optional , d::RepeatCount.bounded(10)),

              d::LoopDef.build("1100", d::RepeatCount.bounded(10),
                s::AT7.use(800, r::Mandatory, d::RepeatCount.bounded(1)),
                s::MS1.use(900, r::Optional , d::RepeatCount.bounded(1)),
                s::MS2.use(1000, r::Optional , d::RepeatCount.bounded(2))),

              d::LoopDef.build("1200", d::RepeatCount.bounded(5),
                s:: N1.use(1300, r::Optional , d::RepeatCount.bounded(1)),
                s:: N3.use(1500, r::Optional , d::RepeatCount.bounded(2)),
                s:: N4.use(1600, r::Optional , d::RepeatCount.bounded(1)))),

            s:: SE.use(2100, r::Mandatory, d::RepeatCount.bounded(1))))
      end
    end
  end
end
