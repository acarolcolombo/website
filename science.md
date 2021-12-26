---
title: Scientific publications
banner: assets/banners/plant-with-web.jpg
article_level_metrics: true
template: base.html
---




{%- for paper in page.papers %}
  {%- set id = loop.index %}
<div class="mb-5">
  <h2 class="fs-4 mb-1">
    {{ paper.title|trim }}
  </h2>
  <p class="mb-1">
    <span class="text-muted">{{ paper.year }}</span>
    |
    {{ paper.authors|trim }}
  </p>
  <p class="text-muted fs-6">
    {%- if paper.openaccess is defined and paper.openaccess %}
      <span class="badge bg-success fw-normal me-1">
        <i class="ai ai-open-access me-1" aria-hidden="true"></i>
        open-access
      </span>
    {%- endif %}
    {{ paper.journal }},
    doi:<a target="_blank" href="https://doi.org/{{ paper.doi }}">{{ paper.doi }}</a>
  </p>
  <button class="btn btn-secondary btn-sm me-1 mb-2" type="button"
      data-bs-toggle="collapse" data-bs-target="#collapse-{{ id }}"
      aria-expanded="false" aria-controls="collapse-{{ id }}">
    Find out more <i class="fa fa-chevron-circle-down ms-1" aria-hidden="true"></i>
  </button>
  <div id="collapse-{{ id }}" class="collapse card fs-6 mt-2 overflow-hidden">
    <div class="card-body">
      <h3 class="fs-4">Abstract</h3>
      {{ paper.abstract|trim }}
      <h3 class="fs-4">Cite as</h3>
      <blockquote class="mb-4">{{ paper.citation|trim }}</blockquote>
      <h3 class="fs-4 mb-4">Citations</h3>
      <span class="__dimensions_badge_embed__" data-doi="{{ paper.doi }}"></span>
    </div>
  </div>
</div>
{%- endfor %}
