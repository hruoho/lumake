use strict;
use warnings;
use autodie;
use YAML qw(LoadFile);
use utf8;

my $data = '_data/data.yml';

my $context = 'osa2';

binmode STDIN, 'utf8';
binmode STDOUT, 'utf8';
####

my @data = @{LoadFile($data)};

foreach my $doc (@data){
	my %doc = %$doc;
	if($doc{'context'} eq $context){
		my $title = $doc{'title'};
		my $href = $doc{'href'};

		my $string = <<"END_SLIDE";
---
layout: slides
title: $title
---

<section>
	<h1>{{page.title}}</h1>
	<h3>{{site.data.$href.size}} tehtävää</h3>
</section>

{% for tehtava in site.data.$href %}

<section>

<h1 class="teht"></h1>
{% for piece in tehtava.tehtava %}

{% if piece.first %}
<ol>
{% for item in piece %}
	<li> {{ item }} </li>
{% endfor %}
</ol>
{% else %}
	<p> {{piece}} </p>
{% endif %}
{% endfor %}
</section>

{% endfor %}

END_SLIDE
		open my $fh, ">:utf8", "$href.html";
		print $fh $string;
		close $fh;
	}
}

