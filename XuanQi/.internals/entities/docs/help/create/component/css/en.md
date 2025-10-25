# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
# Copyright 2023 "Holloway" Chew, Kean Ho <kean.ho.chew@zoralab.com>
# Copyright 2023 ZORALab Enterprise <tech@zoralab.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.




# Create CSS Component Help Section

This is the help section for creating a CSS component either
independently or as part of another bigger component. In order
to include the CSS part, simply feed `css` into the `[TYPES]`
value. Example:

```
# command pattern
$ [XuanQi] create component [TYPES] [NAME]

# just CSS component
$ [XuanQi] create component css [NAME]

# with CSS part inside a composite component
$ [XuanQi] create component "...,css,..." [NAME]
```



## Purpose

CSS component is mainly to create the CSS asset output file
(e.g. `page.css`). XuanQi has both built-in facilities in both
`Shell` functions or copy a regular CSS file.




## File Structures

CSS component complies to the following default file structure:

```
[XUANQI_PATH_COMPONENTS]
└── [XUANQI_COMPONENT_NAME]
       ├── CSS
       │    ├── sample.css
       │    ├── ...
       │    └── xuanqi.sh
       └── XuanQi
            └── import.sh
```

* the component directory is `CSS`.
* the component operator shell script is `CSS/xuanqi.sh`.
* the component operator shell script is called by the main
  component importer shell script `XuanQi/import.sh`.




## `CSS/xuanqi.sh` Main Script

Your **ultimate objective is to write the CSS output
file into `$XUANQI_CONTENT_PATH your way**. How to do it is entirely
up to you.

Multiple router scripts can summon the same component for file
rendering (e.g. different media targets like mobile, print, email
for the same content). Hence, you should strategically design
your required environment variables for users to setup in
the router script.

Then, as `CSS/xuanqi.sh` executes, parse these environment
variables and react accordingly.

You can refer the project's `XuanQi/.internals/API` for available
APIs.




## Programmatically or Copy Over

XuanQi provides both programmable functions and raw copy functions
to easily render the CSS file. The decision depends on your team.

If your team are not familiar with shell scripting, the latter is
preferred so the entire team can work on the supplying `.css`
file instead while XuanQi would just copy it over to
`$XUANQI_CONTENT_PATH`. This is great for those who uses `Sass`
compiler to get the job done.

XuanQi's Shell scripting programmable functions facilitates a
greater in-house flexibilies over the rendering (think macro over
CSS writing). The advantage is no dependency and extremely flexible
with your content generator. This is suitable for seasoned CSS
developers who see `Sass` as an obstruction.

In any case, you're in good hand. Just try it out and adapt
accordingly over time.




## Epilogue

That's all for create CSS component help section.
