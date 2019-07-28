# frozen_string_literal: true

module Stupidedi
  module Contrib
    module SeventyTen
      module Guides

        b = GuideBuilder
        d = Schema
        r = SegmentReqs
        e = ElementReqs
        s = Versions::FunctionalGroups::FortyTen::SegmentDefs
        t = Contrib::FortyTen::TransactionSetDefs

        #
        # Transportation Carrier Shipment Status Message
        #
        QM214 = b.build(t::QM214,
          d::TableDef.header("Heading",
            b::Segment(100, s::ST, "Transaction Set Header",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Transaction Set Identifier Code", b::Values("214")),
              b::Element(e::Required,    "Transaction Set Control Number")),

            b::Segment(200, s::B10, "Beginning Segment for Transportation Carrier Shipment Status Message",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Reference Identification"),
              b::Element(e::Required,    "Shipment Identification Number"),
              b::Element(e::Required,    "Standard Carrier Alpha Code"),
              b::Element(e::NotUsed,     "Inquiry Request Number"),
              b::Element(e::NotUsed,     "Reference Identification Qualifier"),
              b::Element(e::NotUsed,     "Reference Identification"),
              b::Element(e::NotUsed,     "Yes/No Condition or Response Code")),

            d::LoopDef.build("1000",
              d::RepeatCount.bounded(999999),
              b::Segment(100, s::LX, "Assigned Number",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,  "Assigned Number")),

              b::Segment(200, s::L11, "Business Instruction and Reference Number",
                r::Situational, d::RepeatCount.bounded(999),
                b::Element(e::Situational, "Reference Identification"),
                b::Element(e::Situational, "Reference Identification Qualifier"),
                b::Element(e::Situational, "Description")),

              # b::Segment(400, s::Q7, "Lading Exception Status",
              #   r::Situational, d::RepeatCount.bounded(10),
              #   b::Element(e::Required, "Lading Exception Code"),
              #   b::Element(e::Situational, "Packaging Form Code"),
              #   b::Element(e::Situational, "Lading Quantity")),

              b::Segment(500, s::K1, "Remarks",
                r::Situational, d::RepeatCount.bounded(10),
                b::Element(e::Required, "Free-form Information"),
                b::Element(e::Situational, "Free-form Information")),

              b::Segment(700, s::AT8, "Shipment Weight, Packaging and Quantity Data",
                r::Situational, d::RepeatCount.bounded(10),
                b::Element(e::Required,    "Weight Qualifier"),
                b::Element(e::Required,    "Weight Unit Code"),
                b::Element(e::Required,    "Weight"),
                b::Element(e::Situational, "Lading Quantity"),
                b::Element(e::Situational, "Lading Quantity"),
                b::Element(e::Situational, "Volume Unit Qualifier"),
                b::Element(e::Situational, "Volume")),

              d::LoopDef.build("1100",
                d::RepeatCount.bounded(10),
                b::Segment(800, s::AT7, "Shipment Status Details",
                  r::Required, d::RepeatCount.bounded(1),
                  b::Element(e::Situational, "Shipment Status Code"),
                  b::Element(e::Situational, "Shipment Status or Appointment Reason Code"),
                  b::Element(e::Situational, "Shipment Appointment Status Code"),
                  b::Element(e::Situational, "Shipment Status or Appointment Reason Code"),
                  b::Element(e::Situational, "Date"),
                  b::Element(e::Situational, "Time"),
                  b::Element(e::Situational, "Time Code")),

                b::Segment(900, s::MS1, "Equipment, Shipment or Real Property Location",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Situational, "City Name"),
                  b::Element(e::Situational, "State or Province Code"),
                  b::Element(e::Situational, "Country Code"),
                  b::Element(e::Situational, "Longitude Code"),
                  b::Element(e::Situational, "Latitude Code"),
                  b::Element(e::Situational, "Direction Identifier Code"),
                  b::Element(e::Situational, "Direction Identifier Code"),
                  b::Element(e::Situational, "Postal Code")),

                b::Segment(1000, s::MS2, "Equipment or Container Owner and Type",
                  r::Situational, d::RepeatCount.bounded(2),
                  b::Element(e::Situational, "Standard Carrier Alpha Code"),
                  b::Element(e::Situational, "Equipment Number"),
                  b::Element(e::Situational, "Equipment Description Code"),
                  b::Element(e::Situational, "Equipment Number Check Digit"))),

              d::LoopDef.build("1200",
                d::RepeatCount.bounded(5),
                b::Segment(1300, s::N1, "Party Identification",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Entity Identifier Code"),
                  b::Element(e::Required,    "Name"),
                  b::Element(e::Situational, "Identification Code Qualifier"),
                  b::Element(e::Situational, "Identification Code"),
                  b::Element(e::Situational, "Entity Relation Code"),
                  b::Element(e::Situational, "Entity Identifier Code")),

                b::Segment(1500, s::N3, "Party Location",
                  r::Situational, d::RepeatCount.bounded(2),
                  b::Element(e::Required, "Address Information"),
                  b::Element(e::Situational, "Address Information")),

                b::Segment(1600, s::N4, "Geographic Location",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Situational, "City Name"),
                  b::Element(e::Situational, "State or Province Code"),
                  b::Element(e::Situational, "Postal Code"),
                  b::Element(e::Situational, "Country Code"),
                  b::Element(e::Situational, "Location Qualifier"),
                  b::Element(e::Situational, "Location Identifier")))),

            b::Segment(2100, s::SE, "Transaction Set Trailer",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Situational, "Number of Included Segments"),
              b::Element(e::Situational, "Transaction Set Control Number"))))

      end
    end
  end
end
