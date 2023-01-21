trigger JuleeTestHookWebhookTrigger on Case (before insert,after update) {

    String url = 'https://echo-webhook.herokuapp.com/julee';

    String content = Webhook.jsonContent(Trigger.new, Trigger.old);

    Webhook.callout(url, content);

}