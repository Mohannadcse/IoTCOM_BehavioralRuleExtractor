module app_open-garage-door

open IoTBottomUp as base

open cap_contactSensor
open cap_switch

lone sig app_open-garage-door extends IoTApp {
  trigObj : one cap_contactSensor,
} {
  rules = r
}


// application rules base class

abstract sig r extends Rule {}

one sig r1 extends r {}{
  triggers   = r1_trig
  no conditions 
  commands   = r1_comm
}

abstract sig r1_trig extends Trigger {}

one sig r1_trig0 extends r1_trig {} {
  capabilities = app_open-garage-door.trigObj
  attribute    = cap_contactSensor_attr_contact
  value        = cap_contactSensor_attr_contact_val_closed
}


abstract sig r1_comm extends Command {}

one sig r1_comm0 extends r1_comm {} {
  capability   = app_open-garage-door.switch
  attribute    = cap_switch_attr_switch
  value        = cap_switch_attr_switch_val_on
}



