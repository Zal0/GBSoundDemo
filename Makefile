BIN=/opt/gbdk-n/bin
OBJ=./obj
GAME=sound

$(GAME).gb: $(OBJ)/$(GAME).ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/$(GAME).ihx $(GAME).gb

$(OBJ)/$(GAME).ihx: $(OBJ)/$(GAME).rel
	$(BIN)/gbdk-n-link.sh $(OBJ)/$(GAME).rel -o $(OBJ)/$(GAME).ihx

$(OBJ)/$(GAME).rel: $(GAME).c
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-compile.sh $(GAME).c -o $(OBJ)/$(GAME).rel

.PHONY = play
play: $(GAME).gb
	bgb $(GAME).gb

.PHONY = clean
clean:
	rm -rf $(OBJ)
	rm -f $(GAME).gb
