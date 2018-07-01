## Wawa Metrics

An analytics service that tracks website traffic (it's not like google has built anything for that right?).

Built on Rails, with a client-side Javascript snippet.

### Usage

Add the following snippet to your application's Javascript file (ie application.js)

```
var wawametrics = {};

wawametrics.report = function(eventName) {
  var event = { event: { name: eventName } };
  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  console.log(event);
  request.send(JSON.stringify(event));
}
```

Call on HTML pages using:
```
<a href="/example" onclick="wawametrics.report('EXAMPLE link clicked')">
```
or
```
<script>wawametrics.report('EXAMPLE page loaded');</script>
```
