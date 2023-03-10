# apxsp-logger

`apxsp-logger` is a lightweight, intuitive logging framework. Logger can be used to produce actionable insights without the overhead of traditional debug logs.

Developers can use `apxsp.Logger` in place of `System.debug` statements throughout their codebase. This will print information to traditional Apex debug logs, and also generate custom `apxsp__Log__c` records. These records are reportable, and can be easily filtered by class, running user, type, transaction, and more.

Log throughput is controllable via the `apxsp__Log_Setting__c` custom setting object. Like tradititional Salesforce debug logs, users can configure the application to only log messages of a certain thresholds for specific users. For example, you may only want critical `ERROR` logs for most users, but display `FINER` logs for integration users.

Using the included `apxsp.Logger` methods, developers can hook into the logging framework from Apex, Lightning Components, Flow, and even external services.

## Getting Started

### **For General Use**

`apxsp-logger` is available as an unlocked package. See [Releases](https://github.com/jasonsiders/apxsp-logger/releases) for the latest install link.

Note: You must first install any dependencies listed in the [sfdx-project.json](https://github.com/jasonsiders/apex-starter-pack/blob/main/sfdx-project.json) file.

### **For Development**

When contributing to `apxsp-logger`, follow these steps:

1. Sign in to a Salesforce [Dev Hub](https://developer.salesforce.com/docs/atlas.en-us.packagingGuide.meta/packagingGuide/dev_hub_intro.htm).
    - If you don't have access to a DevHub, create a free [Developer Edition](https://developer.salesforce.com/signup) org. Once created, follow the steps to [enable DevHub features](https://developer.salesforce.com/docs/atlas.en-us.packagingGuide.meta/packagingGuide/sfdx_setup_enable_devhub.htm).
2. Create a [new scratch org](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_scratch_orgs_create.htm):

```
sfdx force:org:create -f config/project-scratch-def.json -w 60 --durationdays 30 --loglevel fatal --json --nonamespace --setdefaultusername --setalias {YOUR_ALIAS_HERE}
```

3. Run these commands to clone this repo, create a new branch, and push the code to your scratch org:

```
git clone https://github.com/jasonsiders/apxsp-logger.git
git checkout -b {YOUR_BRANCH_NAME}
sfdx force:source:push
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

## License

See [LICENSE.md](LICENSE.md) for more details.

## Documentation
