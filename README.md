## Sample Adobe Campaign form page template for AEM

This content package contains a sample AEM template and page component to create an Adobe Campaign profile / subscription form page supporting both Classic and Touch UI authoring.

### Target system

This content package is to be installed on **AEM 6.1** with **cq-6.1.0-featurepack-6576**.

### Instructions

1. Clone this git repository, then build and install the content package using `mvn clean install content-package:install`
2. Enable the sample template for your demo site by adding `/apps/ac-forms/templates/.*` to the list of allowed templates, i.e. add the value to the `cq:allowedTemplates` property on the `jcr:content` node of your site root
3. Create a new page using the `Adobe Campaign Form Page Template` template
4. Make sure to select the correct form action: `Save Profile`, `Subscribe to services` or `Unsubscribe from services`
5. Make sure the `acMapping` property on the page's `jcr:content` node is set to `mapRecipient` or `profile` when using **Adobe Campaign 6.1.x** or **Adobe Campaign Standard**, respectively


### Documentation

#### [Page component](jcr_root/apps/ac-forms/components/sample_page/)

The sample page component inherits from `mcm/campaign/components/profile`, which is needed to make the Adobe Campaign integration work on those pages.

For **Touch UI**, ContextHub is included in order to enable the personalization preview:

```
<sling:include path="contexthub" resourceType="granite/contexthub/components/contexthub"/>
```

The Adobe Campaign ContextHub stores check for the presence of an element with id `campaignContextHub` in the HTML to determine whether they should be activated or not:

```
<meta id="campaignContextHub" data-register="true" />
```

Finally, the dialog includes a template picker component, in order to be able to select and set the Adobe Campaign template. See [here](jcr_root/apps/ac-forms/components/sample_page/_cq_dialog/.content.xml#L47-L55) for the component definition.

Similarly for **Classic UI**, ClientContext is included for the personalization preview:

```
<c:include path="config" resourceType="cq/personalization/components/clientcontext_optimized/config"/>
<cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext_optimized" />
```

Additionally, the `mcm.campaign.ui.classic` is embedded for authoring. The dialog equivalently includes a template picker component, see [here](jcr_root/apps/ac-forms/components/sample_page/dialog.xml#L27-L32) for the component definition.

#### [Template](jcr_root/apps/ac-forms/templates/sample_template/)

The template defines three properties on the `jcr:content` node of the page:

`acTemplateId`  
Stores the default Adobe Campaign template id. The property name matches the one defined in the template picker in the Touch and Classic UI dialogs.

`acTemplateLabel`  
Stores the label associated with the default Adobe Campaign template id (relevant for Touch UI only). The property name matches the one defined in the template picker in the Touch UI dialog.

`acMapping`  
Specifies the value of the mapping parameter that is sent along to Adobe Campaign. This needs to be set to `mapRecipient` or `profile` for **Adobe Campaign 6.1.x** or **Adobe Camapaign Standard**, respectively.
