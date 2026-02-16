import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class WordCounter extends JFrame implements ActionListener {

    JTextArea textArea;
    JButton button;
    JLabel result;

    WordCounter() {

        setLayout(new FlowLayout());

        textArea = new JTextArea(5, 20);
        button = new JButton("Count");
        result = new JLabel("");

        add(textArea);
        add(button);
        add(result);

        setSize(300,300);
        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
    
    void init() {
        button.addActionListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        String text = textArea.getText();

        int characters = text.length();

        String wordsArray[] = text.trim().split("\\s+");
        int words = (text.trim().isEmpty()) ? 0 : wordsArray.length;

        result.setText("Words: " + words + "  Characters: " + characters);
    }

    @SuppressWarnings("unused")
    public static void main(String[] args) {
        WordCounter wc = new WordCounter();
        wc.init();
    }
}
