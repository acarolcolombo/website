# My personal website

## Created with Nēnē and in collaboration with @leouieda.

Website: https://www.acarolcolombo.com

Nēnē: https://nene.leouieda.com

Github action status: ![build-html](https://github.com/acarolcolombo/caroldoscopio/workflows/build-html/badge.svg)

## Notes:

### Generating the HTML

We're using a `Makefile` to create rules for generating, serving and cleaning the website.

* Generating the website: `make` or `make all`
* Serving the HTML locally: `make serve`
* Cleaning the automatically generated files (the `_build` folder): `make clean`

### Templates (basics)

The page content (the text) is created in Markdown file (`.md`) and converted
to HTML by Nēnē. The site layout (the HTML around the content) is defined in
"templates" defined in the `_templates` folder. The template language is called
[Jinja](https://jinja2docs.readthedocs.io/). Nēnē will combine the content
(Markdown) with the template (Jinja) to generate the HTML files in `_build`.

All of the text in the Markdown file is included in the `{{ page.body | safe }}`
variable in the template. Extra variables ca be defined in the header of the
Markdown file. These can then be accessed in the template using the same syntax
(for example `{{ page.date }}` and `{{ page.title }}`).

Content added to the template is inserted into every page that uses that
template. We can use this to generate headers and footers that are the same for
all pages, for example.

Template Inheritance is an easy way to reuse templates. There is a parent
(main) template which can be modified by another template. Therefore, it is
possible to keep certain features, such as the same header and footer in all
the pages. To do that, it is necessary to define "blocks" that child templates
can override. See more details in
[here](https://jinja2docs.readthedocs.io/en/stable/templates.html#template-inheritance).
Remember to change the template name in each Markdown header.

**Sidenote:** The parent template should be as general as possible, so that we
can use it to specify things in each page. A way to do that is creating a lot
of "blocks" `{% block example %} {% endblock %}`.

### Configuration

We can configure Nēnē using the `config.yml` file. For example, we can use
that to tell it to ignore some folders or files and insert variables into the
templates.
