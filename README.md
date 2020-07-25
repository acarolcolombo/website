# My own website: Caroldoscopio. 

## Created with Eleventy and in collaboration with @leouieda.

Eleventy: https://www.11ty.dev/

## Notes:

### Generating the HTML

Weŕe using a `Makefile` to create rules for generating, serving and cleaning the website.

* Generating the website: `make` or `make all`
* Serving the HTML to http://localhost:8080: `make serve`
* Cleaning the automatically generated files (the `_site` folder): `make clean`

### Templates (basics)

The page content (the text) is created in Markdown file (`.md`) and converted to HTML by Eleventy. The site layout (the HTML around the content) is defined in "templates"defined in the `_includes` folder. The template language is called [Liquid](https://shopify.github.io/liquid/). Eleventy will combine the content (Markdown) with the template (Liquid) to generate the HTML files in `_site`.

All of the text in the Markdown file is included in the `{{ content }}` variable in the template. Extra avriables ca be defined in the header of te Markdown file. These can then be acessed in the template using the same synthax (for example `{{ date }}` and `{{ title}}`).

**Sidenote:** Dates aee automatically formatted by Eleventy.

Content added to the template is inserted into every page that uses that template. We can use this to generate headers and footers that are the same for all pages, for example.

**Sidenote:** Markdown files not called `index.md` are transformed into a folder + `index.html` file. For example, `about.md` becomes `about/index.html` instead of `about.html`.

### Configuration

We can configure Eleventy using the `config.js` file. For example, we can use that to tll it to copy folders and files to the output (`_site`). This is useful to copy folder with CSS files, images, and other files that aren't HTML and Markdown. The default name for the configuration file is `eleventy.js` bt we changed it to `config.js` in the `Makefile`.
