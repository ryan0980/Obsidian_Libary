// CMPSC 311 SP22
// LAB 2

#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "mdadm.h"
#include "jbod.h"
int mount = 0; // 1 means mounted, 0 means unmounted

int mdadm_mount(void)
{
  // mount
  if (mount = 0) // ready to go
  {
    int mount = jbod_operation(JBOD_MOUNT, NULL); // return 0 on success and -1 on fail
    if (mount = 0)
    {
      mount = 1;
      return 1;
    }
  }

  // fail
  return -1;
}

int mdadm_unmount(void)
{
  // unmount
  if (mount = 1) // ready to go
  {
    int mount = jbod_operation(JBOD_UNMOUNT, NULL); // return 0 on success and -1 on fail
    if (mount = -1)
    {
      mount = 1;
    }
    else
    {
      return 1;
    }
  }

  // fail
  return -1;
}

int mdadm_read(uint32_t addr, uint32_t len, uint8_t *buf)
{
  return len;
}
