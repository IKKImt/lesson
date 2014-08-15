#除外ファイル
exclude = [
	'!**/.DS_Store'
	'!**/Thumbs.db'
	'!**/*.map'
	'!**/_notes/'
	'!**/.gitignore'
]

"use strict"

module.exports = (grunt) ->
	pkg: grunt.file.readJSON('package.json')

	grunt.initConfig
		dir:
			dist: 'dist'
			js: 'js'
			img: 'img'
			jade: 'jade'
			stylus: 'stylus'

		connect:
			server:
				options:
					port: 3000
					hostname: '127.0.0.1'
					base: 'dist'

		clean:
			build:
				src: 'dist/**/'

		stylus:
			product:
				options:
					compress: false
					linenos: false
				files:
					'dist/assets/css/main.css'       :['_stylus/_import.styl']
					'dist/assets/css/add_style.css'  :['_stylus/_add_style.styl']
					# 'output/assets/css/print.css':['templates/partial/stylus/print.styl']
					# 'output/assets/css/index.css':['templates/partial/stylus/index.styl']

			# sample:
			# 	options:
			# 		compress: false
			# 		linenos: false
			# 	files:
			# 		'dist/sample/test.css'       :['_stylus/sample/_test.styl']
			# 		'dist/sample/list.css'       :['_stylus/sample/_list.styl']

		jade:
			top:
				options:
					pretty: true
				files:
					'dist/index.html'         :['_jade/index.jade']
					# 'output/1-1-2_F101021.html':['templates/1-1-2_F101021.jade']

			# sample:
			# 	options:
			# 		pretty: true
			# 	files:
			# 		'dist/sample/test.html'          :['_jade/sample/_test.jade']
			# 		'dist/sample/list.html'          :['_jade/sample/_list.jade']
			# 		'dist/sample/sample_title.html'  :['_jade/sample/_sample_title.jade']
			# 		'dist/sample/sample_btn.html'    :['_jade/sample/_sample_btn.jade']
			# 		'dist/sample/sample_icon.html'   :['_jade/sample/_sample_icon.jade']
			# 		'dist/sample/sample_error.html'  :['_jade/sample/_sample_error.jade']
			# 		'dist/sample/sample_list.html'   :['_jade/sample/_sample_list.jade']
			# 		'dist/sample/sample_rule.html'   :['_jade/sample/_sample_rule.jade']

		copy:
			js:
				expand: true
				cwd: '_script'
				src: '**/*'
				dest: 'dist/assets/js/'
				filter: 'isFile'
			img:
				expand: true
				cwd: '_media'
				src: ['**']
				dest: 'dist/assets/images/'
				filter: 'isFile'

		watch:
			copy:
				files: [
					'_media/**/*.png'
					'_media/**/*.jpg'
					'_media/**/*.gif'
				]
				tasks: ['copy']
			js:
				files: ['_script/**/*.js']
				tasks: ['js']
			stylus:
				files: ['_stylus/**/*.styl']
				tasks: ['stylus']
			jade:
				files: ['_jade/**/*.jade']
				tasks: ['jade']

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-contrib-clean'

	grunt.registerTask 'default', ['clean','stylus','jade','copy','connect','watch']
	# grunt.registerTask 'h', ['connect','watch']
	grunt.registerTask 'h', ['connect']
	grunt.registerTask 'j', ['jade']
	grunt.registerTask 's', ['stylus']
	grunt.registerTask 'c', ['clean']
	grunt.registerTask 'build', ['clean','stylus','jade','copy']