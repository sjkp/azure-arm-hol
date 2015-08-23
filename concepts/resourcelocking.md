#Azure Resource Locking
Using RBAC you can minimize the number of people that have access to certain important resources, but even the few people that do have access can by accident delete resources that shouldn't have been deleted.

To make it harder to delete resources by accident ARM supports the concept of resource locking. You are able to put a lock on a resource, the lock can be either:
- CanNotDelete
- ReadOnly 

Once the lock is in place you have to remove it again before you can either edit the resource or delete it depending on the type of lock you placed on the resource. 

This article describes how resource locking can be accomplished by either PowerShell or directly from the ARM template.
http://blogs.msdn.com/b/cloud_solution_architect/archive/2015/06/18/lock-down-your-azure-resources.aspx 