module LightBrow
  class Browser

    def run
      welcome
      loop do
        input
        break if quit?
        handle
      end
    end

    private

    def welcome
      menu = <<-menutext
Welcome to Lighthouse Browser - Aka LightBrow
      menutext
      puts menu.colorize(:yellow)
      help
    end

    def help
      help = <<-helptext
COMMANDS:
\\? - help text
\\q - quit
\\h - history
\\b - back
      helptext
      puts help.colorize(:blue)
    end

    def handle
      if command?
        handle_command
      else
        visit(@input)
      end
    end

    def command?
      @input.start_with? '\\'
    end

    def handle_command
      case @input
      when '\\?' # \?
        help
      when '\\h' # \h
        history
      when '\\b' # \b
        back
      when '\\f' # \f
        forward
      end
    end

    def history
      puts "History not implemented :(".white.on_red.blink
    end

    def back
      puts "Back not implemented :(".white.on_red.blink
    end

    def forward
      puts "Forward not implemented :(".white.on_red.blink
    end

    def visit(url)
      if response = fetch(url)
        @page = HTMLPage.new(response.body)
        display
      else
        puts " ! Invalid URL ! ".black.on_red
      end
    end

    # TODO: Implement me
    # Try to fetch the given url using Net::HTTP
    # If the URL is invalid, it should not bother fetching the URL and instead just return nil
    def fetch(url)
      # ...
    end

    def display
      print_info "Title", @page.title
      print_info "Description", @page.description
      print_info "Links"
      @page.links.each_with_index do |link, i|
        puts "#{i}. #{link}"
      end
    end

    def menu
      puts "--".colorize(:blue)
      puts "Where to next?"
      print "url> ".colorize(:blue)
    end

    def input
      menu
      @input = gets.chomp
    end

    def quit?
      @input == '\q'
    end

    def print_info(label, value=nil)
      print "#{label}: ".colorize(:red)
      puts value
    end

  end

end
