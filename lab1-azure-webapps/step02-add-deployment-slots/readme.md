#Step 2 - Add Deployment Slots
One of the cool features of Azure Web Apps is the support for deployment slots. A deployment slot is basically a copy of you website, with all resource and the settings you want copied that you can use for e.g. testing or QA purposes. Once you are statisfied with your testing you can use swap the content of a slot with another slot. Slots can also be used for A-B testing, as it can be configured that a percentage of the traffic should be routed to a specific slot. 

Note, slots are only supported on Basic plan and upwards.

The task in this step, is simple we just want to add a test and a production slot to our web application, 
so we are not going to add any extra resource, you will learn how you can configure the web app as a slot is just a configuration. 

 