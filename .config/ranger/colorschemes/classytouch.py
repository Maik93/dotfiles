from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

gold = 222
gold_light = 221

class Default(ColorScheme):
	def use(self, context):
		fg, bg, attr = default_colors

		if context.reset:
			return default_colors

		elif context.in_browser:
			if context.selected:
				fg = white
				attr = bold | reverse
			else:
				attr = normal
			if context.empty or context.error:
				fg = black
			if context.border:
				attr = normal
				fg = gold
			if context.media:
				if context.image:
					fg = white
				else:
					fg = white
			if context.container:
				attr |= normal
				fg = white
			if context.directory:
				attr |= normal
				fg = gold
			elif context.executable and not \
					any((context.media, context.container,
						context.fifo, context.socket)):
				attr |= normal
				fg = gold_light
			if context.socket:
				fg = gold
			if context.fifo or context.device:
				fg = yellow
				if context.device:
					attr |= bold
			if context.link:
				fg = context.good and white or red
			if context.tag_marker and not context.selected:
				attr |= bold
				if fg in (red, white):
					fg = black
				else:
					fg = green
			if not context.selected and (context.cut or context.copied):
				fg = white
				attr |= bold
			if context.main_column:
				if context.selected:
					attr |= normal
				if context.marked:
					attr |= bold
					fg = gold_light
			if context.badinfo:
				if attr & reverse:
					bg = red
				else:
					fg = red

		elif context.in_titlebar:
			attr |= normal
			if context.hostname:
				attr |= normal
				fg = white
			elif context.directory:
				fg = gold
			elif context.tab:
				if context.good:
					bg = green
			elif context.link:
				fg = magenta

		elif context.in_statusbar:
			if context.permissions:
				if context.good:
					fg = gold
				elif context.bad:
					fg = red
			if context.marked:
				attr |= bold | reverse
				fg = yellow
			if context.message:
				if context.bad:
					attr |= bold
					fg = red

		if context.text:
			if context.highlight:
				attr |= bold

		if context.in_taskview:
			if context.title:
				fg = red

			if context.selected:
				attr |= normal

		return fg, bg, attr

