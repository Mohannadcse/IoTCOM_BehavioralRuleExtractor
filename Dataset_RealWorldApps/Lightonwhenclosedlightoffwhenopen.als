module app_Lightonwhenclosedlightoffwhenopen

open IoTBottomUp as base
open cap_runIn
open cap_now
open cap_userInput
open cap_switch
open cap_contactSensor


one sig app_Lightonwhenclosedlightoffwhenopen extends IoTApp {
  
  lights : set cap_switch,
  
  door : one cap_contactSensor,
  seconds : one cap_userInput,
  state : one cap_state,
} {
  rules = r
  //capabilities = lights + door + state + seconds
}

one sig cap_userInput_attr_seconds extends cap_userInput_attr {}
{
    values = cap_userInput_attr_seconds_val
} 


abstract sig cap_userInput_attr_seconds_val extends cap_userInput_attr_value_val {}

one sig cap_state extends cap_runIn {} {
  attributes = cap_state_attr + cap_runIn_attr
}
abstract sig cap_state_attr extends Attribute {}





abstract sig r extends Rule {}

one sig r0 extends r {}{
  triggers   = r0_trig
  conditions = r0_cond
  commands   = r0_comm
}

abstract sig r0_trig extends Trigger {}

one sig r0_trig0 extends r0_trig {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.door
  attribute    = cap_contactSensor_attr_contact
  no value
}


abstract sig r0_cond extends Condition {}

one sig r0_cond0 extends r0_cond {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.seconds
  attribute    = cap_userInput_attr_seconds
  value        = cap_userInput_attr_seconds_val 
}
one sig r0_cond1 extends r0_cond {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.door
  attribute    = cap_contactSensor_attr_contact
  value        = cap_contactSensor_attr_contact_val_open
}

abstract sig r0_comm extends Command {}

one sig r0_comm0 extends r0_comm {} {
  capability   = app_Lightonwhenclosedlightoffwhenopen.lights
  attribute    = cap_switch_attr_switch
  value        = cap_switch_attr_switch_val_off
}

one sig r1 extends r {}{
  no triggers
  conditions = r1_cond
  commands   = r1_comm
}




abstract sig r1_cond extends Condition {}

one sig r1_cond0 extends r1_cond {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.state
  attribute    = cap_runIn_attr_runIn
  value        = cap_runIn_attr_runIn_val_on
}

abstract sig r1_comm extends Command {}

one sig r1_comm0 extends r1_comm {} {
  capability   = app_Lightonwhenclosedlightoffwhenopen.lights
  attribute    = cap_switch_attr_switch
  value        = cap_switch_attr_switch_val_off
}

one sig r2 extends r {}{
  triggers   = r2_trig
  conditions = r2_cond
  commands   = r2_comm
}

abstract sig r2_trig extends Trigger {}

one sig r2_trig0 extends r2_trig {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.door
  attribute    = cap_contactSensor_attr_contact
  no value
}


abstract sig r2_cond extends Condition {}

one sig r2_cond0 extends r2_cond {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.door
  attribute    = cap_contactSensor_attr_contact
  value        = cap_contactSensor_attr_contact_val_open
}
one sig r2_cond1 extends r2_cond {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.seconds
  attribute    = cap_userInput_attr_seconds
  value        = cap_userInput_attr_seconds_val
}

abstract sig r2_comm extends Command {}

one sig r2_comm0 extends r2_comm {} {
  capability   = app_Lightonwhenclosedlightoffwhenopen.state
  attribute    = cap_runIn_attr_runIn
  value        = cap_runIn_attr_runIn_val_on
}

one sig r3 extends r {}{
  triggers   = r3_trig
  conditions = r3_cond
  commands   = r3_comm
}

abstract sig r3_trig extends Trigger {}

one sig r3_trig0 extends r3_trig {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.door
  attribute    = cap_contactSensor_attr_contact
  no value
}


abstract sig r3_cond extends Condition {}

one sig r3_cond0 extends r3_cond {} {
  capabilities = app_Lightonwhenclosedlightoffwhenopen.door
  attribute    = cap_contactSensor_attr_contact
  value        = cap_contactSensor_attr_contact_val - cap_contactSensor_attr_contact_val_open
}

abstract sig r3_comm extends Command {}

one sig r3_comm0 extends r3_comm {} {
  capability   = app_Lightonwhenclosedlightoffwhenopen.lights
  attribute    = cap_switch_attr_switch
  value        = cap_switch_attr_switch_val_on
}



