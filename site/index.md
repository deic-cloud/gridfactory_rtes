---
Site: The ScienceData batch service
Title: 
Description: Catalog of software packages
social:
    - title: Visit us on GitHub
      url: https://github.com/deic-dk/
      icon: octocat
Access: public
---

# %meta.title%

Software packages and groups of users (virtual organizations) for the [ScienceData batch service](https://batch.sciencedata.dk/) are hosted here.

## Runtime environments

[rtes.xml](rtes/rtes.xml) is a catalog of software packages hosted on ScienceData.

If you're running your own GridFactory batch server (see  the [documentation](../developer/BatchProcessing/index)), you can configure it to use this catalogue by editing "/etc/gridfatcory.conf":

In the section `[GridFactory]`, add the line

```
RTE_URLS = https://sciencedata.dk/sites/batch/rtes/rtes.xml
```

The catalog will then be cached locally in `/var/spool/gridfactory/rte_catalog.xml` together with any used pacakages.

See the [documentation](../developer/BatchProcessing/) for details.

## Groups / virtual organizations

The files in the directory [vos/](vos/) define groups of users. Such groups can referenced in the configuration of a batch server to restrict who can submit and pick up jobs.

When you submit jobs to the ScienceData batch service, you can use them to restrict who can pick up and run _your_ jobs.

Groups are referenced by their full URL. It's easy to define and host your own groups.

See the [documentation](../developer/BatchProcessing/) for details.
