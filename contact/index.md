---
title: Contact
banner: assets/banners/plant-with-web.jpg
template: base.html
---

<ul class="fa-ul">
{% for contact in config.contact.links %}
  <li>
  <i class="fa-li {{ contact.icon }}"></i>
  <a href="{{ contact.url }}">{{ contact.text }}</a>
  </li>
{% endfor %}
</ul>
