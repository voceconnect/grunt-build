# Grunt Peon Build
The build task acts like an [alias task](http://gruntjs.com/creating-tasks#alias-tasks) in that it will run multiple tasks as part of the build process, but also accepts targets.  However, the big difference is that these tasks are defined by the config, allowing multiple targets to be setup.  The main purpose of the build task is to execute tasks that normally compile non-source-controlled copies of code.

## Usage Examples

* Run the build task with the default target

    `grunt build`

* Run the build task using development as the target.

    `grunt build:development`


## Configuration

### Options
* 'default' : The default option specifies which build process should be used.  This is used if an empty or non-existing target is passed in.  The default build option should always be set to a build target that can safely be deployed on a non-development environment.  We do this because it means that if we have a new environment added that isn't yet in the config, it can still default to usable build process that doesn't have extra steps like jshint or image compression.

### Suggested Configuration
The suggested configuration for the build task is to have a separate build task per target environment.

```
{
  "build": {
        "options": {
            "default": "production"
        },
        "production":[ "uglify", "compass:production" ],
        "uat":[ "uglify", "compass:production" ],
        "staging":[ "uglify", "compass:staging" ],
        "development": ["img", "jshint", "uglify", "compass:staging"]
    }
}
```

#### Notes
* Since 'uat' should almost always match 'production', you can leave out the 'uat' task aliases as long as the 'default' option is set to 'production.'
* You can easily setup the watch task to point to the build:development task to automatically take care of linting, compressing, and building files during development.
