# My personal website

## Created with Eleventy and in collaboration with @leouieda.

Website: https://www.acarolcolombo.com

Eleventy: https://www.11ty.dev/

Tutorial: https://www.filamentgroup.com/lab/build-a-blog/

Github action status: ![build-html](https://github.com/acarolcolombo/caroldoscopio/workflows/build-html/badge.svg)

## Notes:

### Generating the HTML

Weŕe using a `Makefile` to create rules for generating, serving and cleaning the website.

* Generating the website: `make` or `make all`
* Serving the HTML to http://localhost:8080: `make serve`
* Cleaning the automatically generated files (the `_site` folder): `make clean`

### Templates (basics)

The page content (the text) is created in Markdown file (`.md`) and converted to HTML by Eleventy. The site layout (the HTML around the content) is defined in "templates" defined in the `_includes` folder. The template language is called [Nunjucks](https://mozilla.github.io/nunjucks/templating.html). Eleventy will combine the content (Markdown) with the template (Nunjucks) to generate the HTML files in `_site`.

**Sidenote:** We started the site with the template language Liquid, but changed to Nunjucks because of the lack of Template Inheritance (see explanation below).

All of the text in the Markdown file is included in the `{{ content | safe }}` variable in the template. Extra avriables ca be defined in the header of te Markdown file. These can then be acessed in the template using the same synthax (for example `{{ date }}` and `{{ title}}`).

**Sidenote:** Dates are automatically formatted by Eleventy.

Content added to the template is inserted into every page that uses that template. We can use this to generate headers and footers that are the same for all pages, for example.

**Sidenote:** Markdown files not called `index.md` are transformed into a folder + `index.html` file. For example, `about.md` becomes `about/index.html` instead of `about.html`.

Eleventy includes all site content in the `collections` template variable. It is grouped by "tags". `collections.all` is  alist with all site content. We can generate lists od pages by doig a `for` loop over these lists. For example:
```
{% for post in collections.posts %}
    {{post.url }}
{% endfor %}
```

Template Inheritance is an easy way to reuse templates. There is a parent (main) template which can be modified by another template. Therefore, it is possible to keep certain features, such as the same header and footer in all the pages. To do that, it is necessary to define "blocks" that child templates can override. See more details in [here](https://mozilla.github.io/nunjucks/templating.html#template-inheritance). Remember to change the layout name in each Markdown header.

**Sidenote:** The parent template should be as general as possible, so that we can use it to specify things in each page. A way to do that is creating a lot of "blocks" `{% block example %} {% endblock %}` and variables `{{ example }}`.

### Configuration

We can configure Eleventy using the `config.js` file. For example, we can use that to tll it to copy folders and files to the output (`_site`). This is useful to copy folder with CSS files, images, and other files that aren't HTML and Markdown. The default name for the configuration file is `eleventy.js` bt we changed it to `config.js` in the `Makefile`.
